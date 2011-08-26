class PresmargenController < ApplicationController
  def index
  end

  def procesa
    params[:anio] = 2016
    params[:empresa] = 'Edesal'
    params[:version] = 1
    Margenop.where(:empresa=> params[:empresa], :version=>params[:version], :estado=>'Presupuestado').destroy_all
    completaperiodos(params[:empresa],params[:version],params[:anio])
    
  end
  
  def completaperiodos(empresa,version,aniomax)
    permax =Margenop.where(:empresa=>empresa, :version=>version, :estado=>'Real').maximum(:periodo)
    
    Margenop.where(:empresa=>empresa, :version=>version,:periodo=>permax).each do |m|
      anio = permax.to_s[0..3].to_i
      mes  = permax.to_s[4..5].to_i+1      
      if (mes==13)
        mes = 1
        anio +=1
      end
      
      while anio <= aniomax do
        while mes <=12
          periodo = anio*100 + mes
          
          #aca codigo para presupuestar
          case (m.concepto)
            when 'Cargo Fijo'
              var_cant = var_csmo = 1
              anterior = Margenop.where(:empresa=>empresa, :version=>version, :tarifa=>m.tarifa, :periodo=>periodo-100)[0]
              Premisa.where(:nombre=>'Crecimiento horizontal residencial interanual',:periodo=>((periodo-99)..periodo)).each do |p|
                var_cant = var_cant * (1 + p.valor/100)
              end
              cantidad_n = (anterior.cantidad * var_cant).to_i
              
              
              Margenop.create(:empresa=>empresa, :version=>version, :tarifa=>m.tarifa, :periodo=>periodo, :estado=>'Presupuestado', :concepto=>m.concepto, :cantidad=>cantidad_n)
              puts m.tarifa + '-' + m.concepto + '-' + periodo.to_s + 'variacion-' + var_cant.to_s + '-->' + cantidad_n.to_s
          end
          #fin presupuestación
          
          mes +=1
        end
        anio +=1
        mes =1
      end
    end
    
    return
  end

end
