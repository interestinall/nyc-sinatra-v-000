class FiguresController < ApplicationController


  get '/figures/new' do 
    erb :'/figures/new'
  end

  post '/figures' do 
    @figure = Figure.new(params[:figure])
    if !!params[:landmark][:name]
      @figure.landmarks << Landmark.new(params[:landmark])
    end

    if !!params[:title][:name]
      @figure.titles << Title.new(params[:title])
    end

    @figure.save 
    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/:id' do

    @figure = Figure.find(params[:id])
    erb :'figures/show' 

  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

   post '/figures/:id' do 
    # binding.pry
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure])
      
      if !!params[:landmark][:name]
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      if !!params[:title][:name]
        @figure.titles << Title.create(params[:title])
      end
      
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end


end