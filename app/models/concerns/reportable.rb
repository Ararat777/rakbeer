module Reportable 
  extend ActiveSupport::Concern
  
  class ReportPDF < Prawn::Document
    def make_report(order)
      font "#{Rails.root}/app/assets/fonts/TimesNewRomanRegular.ttf"
      data = [
        ["Номер", order.id],
        ["Время принятия заказа", order.created_at.strftime("%-d.%m.%y %T")],
        ["Время выполнения заказа", order.completed_at.strftime("%-d.%m.%y %T")],
        ["Статус",order.order_status.title],
        ["ФИО клиента",order.client_name],
        ["Номер клиента",order.client_phone],
        ["Адрес доставки",order.adress_delivery],
        ["Метод оплаты",order.payment_method.title],
        ["Сумма заказа", "#{order.order.total_amount} грн"]
        ]
      
      image "#{Rails.root}/app/assets/images/logo.png", :position => :center
      move_down(10)
      text "Отчет по заказу номер #{order.id}",align: :center,size: 20
      move_down(20)
      table(data,:position => :center,:cell_style => {size: 22,borders: []})
      move_down(20)
      text "Спасибо за Ваш заказ!",align: :center,size: 20
      render_file("#{Rails.root}/app/reports/Отчет_по_заказу_#{order.id}.pdf")
    end
  end
end