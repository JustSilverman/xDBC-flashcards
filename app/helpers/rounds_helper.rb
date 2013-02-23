helpers do
  def clean_params(params)
    params.delete_if { |key, value| ["splat", "captures"].include? key }
  end
end
