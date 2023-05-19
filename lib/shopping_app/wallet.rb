# TODO: ファイルのinclude(拡張子がないファイル名)
##equire "lib/ownable"
require_relative "ownable"
class Wallet
  # TODO: モジュールのロード(クラス名)
  include Ownable
  attr_reader :balance

  def initialize(owner)
    self.owner = owner
    @balance = 0
  end

  def deposit(amount)
    @balance += amount.to_i
  end

  def withdraw(amount)
    return unless @balance >= amount
    @balance -= amount.to_i
    amount
  end

end