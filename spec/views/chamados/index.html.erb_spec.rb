require 'spec_helper'

describe "chamados/index" do
  before(:each) do
    assign(:chamados, [
      stub_model(Chamado,
        :status => "Status",
        :ativo => "Ativo",
        :descricao => "Descricao",
        :prioridade => ""
      ),
      stub_model(Chamado,
        :status => "Status",
        :ativo => "Ativo",
        :descricao => "Descricao",
        :prioridade => ""
      )
    ])
  end

  it "renders a list of chamados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Ativo".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
