require 'spec_helper'

describe "chamados/new" do
  before(:each) do
    assign(:chamado, stub_model(Chamado,
      :status => "MyString",
      :ativo => "MyString",
      :descricao => "MyString",
      :prioridade => ""
    ).as_new_record)
  end

  it "renders new chamado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", chamados_path, "post" do
      assert_select "input#chamado_status[name=?]", "chamado[status]"
      assert_select "input#chamado_ativo[name=?]", "chamado[ativo]"
      assert_select "input#chamado_descricao[name=?]", "chamado[descricao]"
      assert_select "input#chamado_prioridade[name=?]", "chamado[prioridade]"
    end
  end
end
