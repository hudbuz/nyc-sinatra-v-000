class LandmarksController < ApplicationController

  get '/landmarks' do 
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end


  get '/landmarks/new' do 


    @landmarks = Landmark.all
    @figures = Figure.all
    @titles = Title.all

    erb :'/landmarks/new'
  end

  post '/landmarks' do 



    @landmark = Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])



    @landmark.save
    redirect '/landmarks'
  end


  get '/landmarks/:id' do 

    @landmark = Landmark.find(params[:id])


    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    redirect "/landmarks/#{@landmark.id}"
  end

end
