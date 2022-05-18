class Concessionaria
    attr_accessor :carros, :motos, :faturamento, :estoque, :qtdCarrosVendidos, :qtdMotosVendidas, :servicos, :listaClientes, :servicoAndamento,
    :servicosFinalizados
    
    #### VARIÁVEIS DE ESTADO ####

      def initialize(carros = {}, motos = {}, faturamento = 0, qtdCarrosVendidos = 0, qtdMotosVendidas = 0, estoque = {}, servicos = {}, 
        listaClientes = {}, servicoAndamento = {}, servicosFinalizados = {})
        @carros = carros # 1
        @motos = motos # 2
        @faturamento = faturamento # 3
        @estoque = estoque # 4
        @qtdCarrosVendidos = qtdCarrosVendidos # 5
        @qtdMotosVendidas = qtdMotosVendidas # 6
        @servicos = servicos # 7
        @listaClientes = listaClientes # 8
        @servicoAndamento = servicoAndamento # 9
        @servicosFinalizados = servicosFinalizados # 10
      end
    
      #### OPERAÇÕES #### 

      def adicionaVeiculo(modelo, preco, tipo) # 1
        if tipo.downcase == "carro"
            carros[modelo] = preco
            puts carros
        else
            motos[modelo] = preco
            puts motos
        end
      end
    
      def venderVeiculo(modelo, tipo, quantidade) # 2
        saidaEstoque(modelo, quantidade) #remove do estoque
        if tipo.downcase == "carro"
            faturamento = faturamento + carros[modelo] #soma ao faturamento
            qtdCarrosVendidos = qtdCarrosVendidos + quantidade #soma a qtd de carros vendidos
        else
            faturamento = faturamento + motos[modelo]
            qtdMotosVendidas = qtdMotosVendidas + quantidade
        end
      end

      def entradaEstoque(modelo, quantidade) # 3
        if estoque[modelo] != nil
        qtdAnterior = estoque[modelo]
        estoque[modelo] = qtdAnterior + quantidade
       else
        estoque[modelo] = quantidade
       end
       puts estoque[modelo]
      end

      def saidaEstoque(modelo, quantidade) # 4
        estoque[modelo] = estoque[modelo] - quantidade
        puts estoque[modelo]
    end

    def adicionaServico(tipoServico, preco) # 5
        servicos[tipoServico] = preco
        puts servicos
    end

    def adicionaCliente(cpf, placas) # 6
        listaClientes[cpf] = placas
        puts listaClientes
    end

    def adicionaServicoAndamento(placa, servicos) # 7
        servicoAndamento[placa] = servicos
        puts servicoAndamento
    end

    def finalizaServico(placa, servicos) # 8
        servicoAndamento.delete(placa)
        servicosFinalizados[placa] = servicos
        puts servicosFinalizados
    end
end

#C = Concessionaria.new
#C.adicionaCliente('51111383820', ['ABC-1234', 'ABC-1231'])
#C.adicionaVeiculo('M3', 350000, "carro")
#C.entradaEstoque('M3', 100)
#C.saidaEstoque('M3', 1)
#C.entradaEstoque(:Yamaha, 200)