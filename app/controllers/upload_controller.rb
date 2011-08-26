class UploadController < ApplicationController
  def index
  end

  def procesa
    arrtmp = Array.new
    periodo = 0
    tarifa = ''
    concepto = ''
    consumo = 0
    importe = 0
    cantidad = 0
    n = 0

    case (params[:archivo].original_filename)
      when 'venta_sl.txt'
        params[:archivo].read.each_line {|l|
          arrtmp = l.split(/\t|\r|\n/)
          periodo   = arrtmp[0]
          if (periodo.to_i > 0)
            tarifa    = arrtmp[1]
            concepto  = arrtmp[2]
            consumo   = arrtmp[3]
            importe   = arrtmp[4]
            cantidad  = arrtmp[5]
            Margenop.where(:empresa=>'Edesal',:version=>1,:periodo=>periodo,:tarifa=>tarifa,:concepto=>concepto).destroy_all
            Margenop.create(:empresa=>'Edesal',:version=>1,:estado=>'Real',:periodo=>periodo,:tarifa=>tarifa,:concepto=>concepto,:cantidad=>cantidad,:consumo_vta=>consumo,:importe_vta=>importe)
          end
          n+=1
        }  #fin venta_sl.txt
        
      when 'premisas.txt'
        Premisa.where(:empresa=>'Edesal',:version=>1).destroy_all
        params[:archivo].read.each_line {|l|
          arrtmp = l.split(/\t|\r|\n/)
          nombre   = arrtmp[0]
          if (nombre != 'Premisas')
            periodo = arrtmp[1]
            valor   = arrtmp[2]
            Premisa.create(:empresa=>'Edesal',:version=>1,:nombre=>nombre,:periodo=>periodo,:valor=>valor)
          end
          n +=1          
        }                
      end        
    
    render :text=> 'Lineas procesadas: ' + n.to_s
    
  end

end
