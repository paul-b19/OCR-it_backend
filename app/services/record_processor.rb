class RecordProcessor
  require 'cloudmersive-ocr-api-client'

  def initialize(record_params)
    @record_params = record_params
  end

  def ocr_api_post
    # Setup authorization
    CloudmersiveOcrApiClient.configure do |config|
      config.api_key['Apikey'] = ENV['PIMP_MY_APP']
    end
    
    api_instance = CloudmersiveOcrApiClient::ImageOcrApi.new
    # image_file = File.new("app/services/test.png")    # image file test
    image_file = File.new(@record_params[:image])
    opts = { 
      language: @record_params[:language] # Language of the input document, Possible values are ENG (English), BEL (Belarusian), POR (Portuguese), RUS (Russian), SPA (Spanish)
    }
    
    begin
      #Convert a photo of a document into text
      result = api_instance.image_ocr_photo_to_text(image_file, opts)
      p result
      puts result
      puts @record_params
      final_record = persist_record(result)
    rescue CloudmersiveOcrApiClient::ApiError => e
      puts "Exception when calling ImageOcrApi->image_ocr_photo_to_text: #{e}"
      final_record = "Exception when calling ImageOcrApi->image_ocr_photo_to_text: #{e}"
    end
    final_record
  end

  def persist_record(result)
    record = Record.create(
      group: 'Undefined',
      title: 'Undefined',
      body: result.text_result,
      confidence: result.mean_confidence_level*100,
      user_id: @record_params[:user_id]
    )
  end

end