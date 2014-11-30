module DownloadsSubcontroller
  extend ActiveSupport::Concern
  
  def xlsx
    model = self.class.name.sub('Controller', '').singularize

    package   = Axlsx::Package.new
    workbook  = package.workbook
    @data     = model.constantize.all
  
    workbook.add_worksheet(name: "#{model} report") do |sheet|
      fields = model.constantize.attribute_names
      sheet.add_row fields
      @data.each do |record|
        sheet.add_row fields.map{ |field| record.send(field) }
      end
    end
    
    file_name   = "#{model}.xlsx"
    file_format = "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
    
    send_data package.to_stream.read, filename: file_name, type: file_format
  end

  def pdf
    model = self.class.name.sub('Controller', '').singularize
    @data = model.constantize.all
 
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@data)
        send_data pdf.render, filename: "#{model}.pdf", type: 'application/pdf'
      end
    end    
  end

end