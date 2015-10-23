class ServicosController < ApplicationController
  before_action :set_servico, only: [:show, :edit, :update, :destroy]

  # GET /servicos
  # GET /servicos.json
  def index
    @servicos = Servico.order(:nome).page params[:page]
  end

  # GET /servicos/1
  # GET /servicos/1.json
  def show
  end

  # GET /servicos/new
  def new
    @servico = Servico.new
  end

  # GET /servicos/1/edit
  def edit
  end

  # POST /servicos
  # POST /servicos.json
  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: 'Servico foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicos/1
  # PATCH/PUT /servicos/1.json
  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to @servico, notice: 'Servico foi alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1
  # DELETE /servicos/1.json
  def destroy
    respond_to do |format|
      if @servico.destroy
        format.html { redirect_to servicos_url, notice: 'Servico foi removido com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to servicos_url, error: 'O serviço não pode ser removido pois existem orçamentos realizados para ele.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico
      @servico = Servico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servico_params
      params.require(:servico).permit(:nome, :unidade, :valor)
    end
end
