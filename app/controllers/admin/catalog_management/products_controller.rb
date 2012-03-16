# -*- coding: utf-8 -*-
class Admin::CatalogManagement::ProductsController < Admin::CatalogManagement::CatalogManagementController

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  before_filter :find_all_products, :only => [:index, :show, :new, :create, :edit, :update]


  #===========================================================================#
  #===   ACTIONS
  #===========================================================================#
  def index
    @show_form = false

  end


  def show
    @product = Product.find(params[:id])
    @category = Category.all
    render "index"
  end


  def new
    @product = Product.new
    @category = Category.all
    render "index"
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.all
    render "index"
  end


  def create
    @product = Product.new(params[:product])
    @category = Category.all
    if @product.save
      redirect_to(admin_catalog_management_products_path, :notice => "Cr&eacute;ation du produit effectu&eacute;e avec succès")
    else
      render "index"
    end
  end


  def update
    @product = Product.find(params[:id])
    @category = Category.all
    if @product.update_attributes(params[:product])
      redirect_to(admin_catalog_management_products_path, :notice => "Modification du produit effectu&eacute;e avec succès")
    else
      render "index"
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to(admin_catalog_management_products_path, :notice => "Suppression du produit effectu&eacute;")
  end

  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  def find_all_products
    @products = Product.all
    @show_form = true
  end
end
