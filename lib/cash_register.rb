class CashRegister
    attr_accessor :discount, :total, :last_transaction, :items
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            self.items << title
        end
        self.last_transaction = price*quantity
        self.total+= self.last_transaction
        
    end

    # def add_item(title, amount, quantity = 1)
    #     self.last_transaction = amount * quantity
    #     self.total += self.last_transaction
    #     quantity.times do
    #       self.items << title
    #     end
    #   end

    def apply_discount
        if discount!= 0
            percentage_discount = (100 - self.discount.to_f)/100
            self.total = (self.total*percentage_discount)
            "After the discount, the total comes to $#{total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total -  self.last_transaction
    end
end