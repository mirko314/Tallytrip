class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :destroy, :check]
    
    def index
        @items = Item.all.order("created_at ASC")
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path
        else 
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @item.destroy
        redirect_to root_path
    end

    def update
        if @item.update(item_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def check
        @item.update_attribute(:checked_at, Time.now)
    end

    private
    def item_params
        params.require(:item).permit(:title, :description)
    end

    def find_item
         @item = Item.find(params[:id])
    end


end
