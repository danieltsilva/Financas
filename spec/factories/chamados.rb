# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chamado do
    status "MyString"
    ativo "MyString"
    descricao "MyString"
    prioridade ""
    data_abertura "2013-04-17 16:44:09"
    data_fechamento "2013-04-17 16:44:09"
  end
end
