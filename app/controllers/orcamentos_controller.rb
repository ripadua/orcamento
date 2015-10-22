class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.all
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
    
    #servico = Servico.find(1)
    
    #orcamento_servico = OrcamentoServico.new()
    #orcamento_servico.servico = servico
    #orcamento_servico.quantidade = 2
    
    #@orcamento.orcamento_servicos << orcamento_servico
  end

  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)
    
    for orc in orcamento_servicos_params
      orcamento_servico = OrcamentoServico.new(orc)
      @orcamento.orcamento_servicos << orcamento_servico
    end
    
    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to @orcamento, notice: 'Orcamento was successfully created.' }
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
    
    @orcamento.orcamento_servicos.clear
    
    for orc in orcamento_servicos_params
      orcamento_servico = OrcamentoServico.new(orc)
      @orcamento.orcamento_servicos << orcamento_servico
    end
    
    respond_to do |format|
      if @orcamento.update(orcamento_params)
        format.html { redirect_to @orcamento, notice: 'Orcamento was successfully updated.' }
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
      format.html { redirect_to orcamentos_url, notice: 'Orcamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def add_servico
    @orcamento = Orcamento.new(orcamento_params)
    
    orcamento_servico = OrcamentoServico.new(orcamento_servico_params)
    
    @orcamento.orcamento_servicos << orcamento_servico
    
    respond_to do |format|
      format.json { render json: @orcamento.to_json(:include => {:orcamento_servicos => { :include => :servico}}) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:data, :cliente_id, :descricao, :forma_pagamento, :observacoes, :validade)
    end
    
    def orcamento_servico_params
      params.require(:orcamento_servico).permit(:servico_id, :quantidade)
    end
    
    def orcamento_servicos_params
      params.permit(orcamento_servicos: [:servico_id, :quantidade]).require(:orcamento_servicos)
    end
end
