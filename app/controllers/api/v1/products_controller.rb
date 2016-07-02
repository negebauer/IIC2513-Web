class Api::V1::ProductsController < Api::V1::BaseController
    before_action :admin_required, only: [:update, :destroy]
    before_action :set_uuid, only: [:show, :update, :destroy]

    def index
        render json: Product.uuids, status: 200
    end

    def show
        if product = Product.where(uuid: @uuid).first
            render json: { product: product }, status: 200 if stale?(product)
        else
            render json: { message: 'Producto no existe' }, status: 404
        end
    end

    def update
        # First make sure all params are there if it's a PUT
        if request.put? && !Product.validate_params(product_params)
            return render json: { message: 'Faltan datos', params: product_params, expected_params: Product.required_params }, status: 400
        end
        if product = Product.where(uuid: @uuid).first
            # We have a product with this uuid
            if product.update(product_params)
                render json: { product: product }, status: 200
            else
                render json: { message: 'Falló actualización', params: product_params }, status: 500
            end
        else
            # Let's create a new product only if PUT
            unless request.put?
                return render json: { message: 'Producto no existe' }, status: 404
            end
            product = Product.new(product_params)
            if product.save
                render json: { product: product }, status: 201
            else
                render json: { message: 'Falló creacion', product: product, params: product_params }, status: 500
            end
        end
    end

    def destroy
        if product = Product.where(uuid: @uuid).first
            product.destroy
            render json: { message: 'Producto eliminado' }, status: 200
        else
            render json: { message: 'Producto no existe' }, status: 404
        end
    end

    private

    def set_uuid
        unless params[:product][:id].nil?
            @uuid = params[:product][:id]
            params[:product][:uuid] = @uuid
        end
        params[:product].delete(:controller)
        params[:product].delete(:id)
        params[:product].delete(:action)
    end

    def product_params
        params.require(:product).permit(:name, :price, :stock, :description, :family, :promotion, :image, :uuid)
    end
end
