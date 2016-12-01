class CashRegister

attr_accessor :items, :total, :discount, :last_transaction

def initialize(discount=0)
    @total = 0
    @discount = discount
    @items=[]
end

def add_item(name, price, quantity=1)
    @total=@total+(price*quantity)
    count = 0
    while count < quantity
        @items << name
        count += 1
    end
    @last_transaction = @total
end


def apply_discount
    if @discount == 0
        "There is no discount to apply."
    else
        @total = @total * ((100 - @discount.to_f)/100)
        "After the discount, the total comes to $#{@total.to_i}."
    end
end

def void_last_transaction
    @total = @total - @last_transaction
    @items.delete_at(@items.length-1)
end

end