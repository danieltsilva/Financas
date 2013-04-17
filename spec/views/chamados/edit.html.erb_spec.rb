require 'spec_helper'

describe "chamados/edit" do
  before(:each) do
    @chamado = assign(:chamado, stub_model(Chamado,
      :status => "MyString",
      :ativo => "MyString",
      :descricao => "MyString",
      :prioridade => ""
    ))
  end

  it "renders the edit chamado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", chamado_path(@chamado), "post" do
      assert_select "input#chamado_status[name=?]", "chamado[status]"
      assert_select "input#chamado_ativo[name=?]", "chamado[ativo]"
      assert_select "input#chamado_descricao[name=?]", "chamado[descricao]"
      assert_select "input#chamado_prioridade[name=?]", "chamado[prioridade]"
    end
  end
end
