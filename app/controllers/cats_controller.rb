class CatsController < ApplicationController
  before_action :set_cat, only: %i[show update destroy]

  # GET /cats
  def index
    @cats = Cat.all

    render json: @cats
  end

  # GET /cats/1
  def show
    render json: @cat
  end

  # POST /cats
  def create
    request_body = JSON.parse(request.body.read)
    if request_body.is_a?(Array)
      response = []
      request_body.each do |cat|
        @cat = Cat.new(cat)
        if @cat.save
          response << @cat
        else
          return render json: @cat.errors, status: :unprocessable_entity
        end
      end
      return render json: {message: 'success', data: response}, status: :ok
    end
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: {message: 'success', data: @cat}, status: :ok
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/1
  def update
    if @cat.update(cat_params)
      render json: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cats/1
  def destroy
    @cat.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cat
    @cat = Cat.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cat_params
    params.require(:cat).permit(:name, :age, :breed, :price)
  end
end
