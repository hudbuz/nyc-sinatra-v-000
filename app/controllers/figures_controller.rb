class FiguresController < ApplicationController

  get '/figures' do 
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/index'
  end


  get '/figures/new' do 

    @landmarks = Landmark.all
    @figures = Figure.all
    @titles = Title.all

    erb :'/figures/new'
  end

  post '/figures' do 


    @figure = Figure.new(name: params[:figure][:name])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:completion_year])
     
    elsif !params[:figure][:landmark_ids].nil?
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids][0])
    end

    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.figure_titles.build(title: title)
    elsif !params[:figure][:title_ids].nil?
      title = Title.find(params[:figure][:title_ids][0])
      @figure.figure_titles.build(title: title)
    end

    @figure.save



    redirect '/figures'
  end

  get '/figures/:id' do 

    @figure = Figure.find(params[:id])

    @landmarks = @figure.landmarks

    @titles = @figure.titles

    erb :'/figures/show'
  end


  get '/figures/:id/edit' do 

    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all




    erb :'/figures/edit'
  end

  post '/figures/:id' do 

    @figure = Figure.find(params[:id])
   

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:completion_year])
     
    elsif !params[:figure][:landmark_ids].nil?
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids][0])
    end

    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.figure_titles.build(title_id: title.id)
    elsif !params[:figure][:title_ids].nil?

      title = Title.find(params[:figure][:title_ids][0])
   
      @figure.figure_titles.build(title_id: title.id)
    end

    @figure.update(name: params[:figure][:name]) if params[:figure][:name] != @figure.name

    @figure.save




    redirect "/figures/#{@figure.id}"
  end



end
