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
    debugger
    permax =Margenop.where(:empresa=>empresa, :version=>version, :estado=>'Real').maximum(:periodo)
    anio = permax.to_s[0..3].to_i
    mes  = permax.to_s[4..5].to_i
    
    Margenop.where(:empresa=>empresa, :version=>1,:periodo=>permax).each do |m|
      anio = permax.to_s[0..3].to_i
      mes  = permax.to_s[4..5].to_i
      while anio <= aniomax do
        while mes <=12
          
          #aca codigo para presupuestar
          
          
          mes +=1
        end
        anio +=1
        mes =1
      end
    end
    
    return
  end

end
