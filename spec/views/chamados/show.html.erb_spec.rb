require 'spec_helper'

describe "chamados/show" do
  before(:each) do
    @chamado = assign(:chamado, stub_model(Chamado,
      :status => "Status",
      :ativo => "Ativo",
      :descricao => "Descricao",
      :prioridade => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    rendered.should match(/Ativo/)
    rendered.should match(/Descricao/)
    rendered.should match(//)
  end
end
