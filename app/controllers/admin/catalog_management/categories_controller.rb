# -*- coding: utf-8 -*-
class Admin::CatalogManagement::CategoriesController < Admin::CatalogManagement::CatalogManagementController

  #===========================================================================#
  #===   FILTERS
  #===========================================================================#
  before_filter :find_all_categories, :only => [:index, :show, :new, :create, :edit, :update]

  #===========================================================================#
  #===   ACTIONS
  #===========================================================================#
  def index
    @show_form = false

  end


  def show
    @category = Category.find(params[:id])
    render "index"
  end


  def new
    @category = Category.new
    render "index"
  end

  def edit
    @category = Category.find(params[:id])
    render "index"
  end


  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to(admin_catalog_management_categories_path, :notice => "Cr&eacute;ation de la cat&eacute;gorie effectu&eacute;e avec succ&agrave;s")
    else
      render "index"
    end
  end


  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to(admin_catalog_management_categories_path, :notice => "Modification de la cat&eacute;gorie effectu&eacute;e avec succ&egrave;s")
    else
      render "index"
    end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to(admin_catalog_management_categories_path, :notice => "Suppression de la cat&eacute;gorie effectu&eacute;e avec succ&egrave;s")
  end

  #===========================================================================#
  #===   PROTECTED
  #===========================================================================#
  protected

  def find_all_categories
    @categories = Category.all
    @show_form = true
  end


end
