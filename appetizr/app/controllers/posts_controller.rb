class PostsController < ApplicationController
  def new
    @post = Post.new
    session[:post_category] = params[:category]
  end

  def create
    nombre_imagen = subir_imagen(params.require(:post)[:image])
    usuario = User.find_by(nombre: session[:username])
    # Cambiar en un futuro para que el usuario sea el post añada el campo de comentado por restaurante
    @post = Post.new(categoria: session[:post_category], autor: session[:username], contenido: params[:post][:content], ruta_img: nombre_imagen, created_at: Time.now, updated_at: Time.now)

    session[:post_category] = nil
    if @post.save
      redirect_to category_path(@post.categoria), notice: "All good"
    else
      render :new
    end
  end



  private
  def post_params
    params.require(:post).permit(:categoria, :autor, :contenido, :image)
  end

  def subir_imagen(imagen)
    begin
      nombre_imagen = SecureRandom.hex(10) + File.extname(imagen.original_filename)
      ruta = File.join("app", "assets", "images", nombre_imagen)
      File.open(ruta, "wb") do |f| 
         f.write(imagen.read)
      end
      nombre_imagen
    
    rescue => e
      Rails.logger.error "Error al subir la imagen: #{e.message}"
      nil
    end
  end
end
