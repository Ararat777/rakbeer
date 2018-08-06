module Reportable 
  extend ActiveSupport::Concern
  
  class ReportPDF < Prawn::Document
    def make_report(order)
      font "#{Rails.root}/app/assets/fonts/TimesNewRomanRegular.ttf"
      data = [
        ["Номер", order.id],
        ["Дата и время", order.created_at.strftime("%F %T")],
        ["Статус",order.order_status.title],
        ["ФИО клиента",order.client_name],
        ["Номер клиента",order.client_phone],
        ["Адрес доставки",order.adress_delivery],
        ["Метод оплаты",order.payment_method.title],
        ["Сумма заказа", "#{order.order.total_amount} грн"]
        ]
      
      text "Отчет по заказу номер #{order.id}",align: :center,size: 20
      move_down(20)
      table(data)
      render_file("#{Rails.root}/app/reports/Отчет_по_заказу_#{order.id}.pdf")
    end
  end
end