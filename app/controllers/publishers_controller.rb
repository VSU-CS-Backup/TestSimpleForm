class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order("name")
  end

  def show
    @publisher = Publisher.find(params[:id])
    @products = @publisher.products
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(params[:publisher])
    if @publisher.save
      redirect_to @publisher, notice: "Successfully created publisher."
    else
      render :new
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
      redirect_to @publisher, notice: "Successfully updated publisher."
    else
      render :edit
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    redirect_to publishers_url, notice: "Successfully destroyed publisher."
  end
end
