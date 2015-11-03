class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy, :print]

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.order(:id).page params[:page]
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
    @orcamento.data = Time.now
    @orcamento.validade = Time.now + 30.days
    @orcamento.desconto = 0.00
  end
  
  def new_from_cliente
    @orcamento = Orcamento.new
    @orcamento.data = Time.now
    @orcamento.validade = Time.now + 30.days
    @orcamento.desconto = 0.00
    @orcamento.cliente = Cliente.find(params[:cliente_id])
    render :new
  end
  
  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)
    
    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to @orcamento, notice: 'Orçamento foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @orcamento }
      else
        format.html { render :new }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    
    OrcamentoServico.where(orcamento: @orcamento).destroy_all
    
    respond_to do |format|
      if @orcamento.update(orcamento_params)
        format.html { redirect_to @orcamento, notice: 'Orçamento foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @orcamento }
      else
        format.html { render :edit }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    respond_to do |format|
      format.html { redirect_to orcamentos_url, notice: 'Orçamento foi removido com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  # GET /orcamentos/1/print
  def print
    render :layout => 'orcamento'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:data, :cliente_id, :flag_local_diferente, :local_servico, :descricao, :forma_pagamento, :desconto, :observacoes, :validade, orcamento_servicos_attributes: [:id, :servico_id, :quantidade])
    end
end
