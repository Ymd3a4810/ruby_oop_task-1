require_relative "item_manager"
require_relative "ownable"

class Cart
  include ItemManager
  include Ownable

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    # Cartにとってのitemsは自身の@itemsとしたいため、ItemManagerのitemsメソッドをオーバーライドします。
    # CartインスタンスがItemインスタンスを持つときは、オーナー権限の移譲をさせることなく、自身の@itemsに格納(Cart#add)するだけだからです。
    @items
  end

  def add(item)
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end

  def check_out
    p "checkout is called"
    return if owner.wallet.balance < total_amount

    # ## 要件
    #   - カートの中身（Cart#items）のすべてのアイテムの購入金額が、カートのオーナーのウォレットからアイテムのオーナーのウォレットに移されること。
    #自分で追加
    # TODO: カート内のすべてのアイテムをループする
    @items.each do |item|
      # TODO: 2. オーナー権限が、カートのオーナーに移されること
      #puts item.price
      
      # TODO: 1.1. 購入金額が、カートのオーナーのウォレットから金額を取り出す
      withdraw_price = self.owner.wallet.withdraw(item.price)
      if withdraw_price != nil
        # TDDO: 1.2. アイテムのオーナーのウォレットに移されること
        item.owner.wallet.deposit(withdraw_price)
        # TODO: 2. アイテムのオーナー権限が、カートのオーナーに移されること
        item.owner = self.owner
      end
      # Customerというオブジェクト => 自分
      #puts "#{self.owner.name}, #{self.owner.wallet.balance}"
      # Sellerというオブジェクト => お店
      #puts "#{item.owner.name}, #{item.owner.wallet.balance}"

    end
  
    # 3. TODO: カートの中身が空になること
    @items.clear
    #puts @items
    #   - カートの中身（Cart#items）のすべてのアイテムのオーナー権限が、カートのオーナーに移されること。

    #   - カートの中身（Cart#items）が空になること。

    # ## ヒント
    #   - カートのオーナーのウォレット ==> self.owner.wallet
    #   - アイテムのオーナーのウォレット ==> item.owner.wallet
    #   - お金が移されるということ ==> (？)のウォレットからその分を引き出して、(？)のウォレットにその分を入金するということ
    #   - アイテムのオーナー権限がカートのオーナーに移されること ==> オーナーの書き換え(item.owner = ?)
  end

end
