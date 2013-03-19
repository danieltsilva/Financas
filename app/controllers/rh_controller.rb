class RhController < ApplicationController
  def relatorio_kpis
    puts "PARAMS #{params}"

    unless params[:filtros].nil?
      ano = params[:filtros][:ano]
    else
      ano = Time.now.year
    end

    #receitas = Array.new

    #meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
    #         "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

    #meses.each_with_index do |mes, i|
    #  receitas[i.next] = 0

      #(Calendario.find_all_by_mmyyyy mes).each do |dia|
       # dia.receitas.each do |receita|
        #  puts "RECEITA #{receita}"
         # receitas[i.next] += receita.valor
        #end
      #end
    #end

    #@dados = receitas

    meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]
    @dados = Array.new

    meses.each_with_index do |mes, i|
      data = CalendarioMes.find_by_mmyyyy mes
      @dados[i.next] = data.fato_rh_produtividade.produtividade_total.round(2)
    end

  end
end