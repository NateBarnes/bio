class BioMethod < BioObject
  def initialize params, body
    @params, @body = params, body
  end

  def call receiver, arguments
    context = Context.new receiver
    @params.each_with_index do |param,index|
      context.locals[param] = arguments[index]
    end

    @body.eval context
  end
end
