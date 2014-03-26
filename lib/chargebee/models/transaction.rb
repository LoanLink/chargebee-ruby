module ChargeBee
  class Transaction < Model

    class LinkedInvoice < Model
      attr_accessor :invoice_id, :applied_amount, :invoice_date, :invoice_amount
    end

  attr_accessor :id, :subscription_id, :payment_method, :reference_number, :gateway, :description,
  :type, :date, :amount, :id_at_gateway, :status, :error_code, :error_text, :voided_at, :void_description,
  :masked_card_number, :refunded_txn_id, :linked_invoices

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/transactions", params, env)
  end    

  def self.transactions_for_subscription(id, params={}, env=nil)
    Request.send('get', "/subscriptions/#{id.to_s}/transactions", params, env)
  end    

  def self.transactions_for_invoice(id, params={}, env=nil)
    Request.send('get', "/invoices/#{id.to_s}/transactions", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/transactions/#{id.to_s}", {}, env)
  end    

  def self.record_payment(id, params, env=nil)
    Request.send('post', "/invoices/#{id.to_s}/record_payment", params, env)
  end    

  def self.refund(id, params={}, env=nil)
    Request.send('post', "/transactions/#{id.to_s}/refund", params, env)
  end    

  end # ~Transaction
end # ~ChargeBee    