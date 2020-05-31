require 'rails_helper'
require 'byebug'
RSpec.describe "Phrases endpoint", type: :request do
    def stub_omniauth
        # first, set OmniAuth to run in test mode
        OmniAuth.config.test_mode = true
        # then, provide a set of fake oauth data that
        # omniauth will use when a user tries to authenticate:
        OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
            provider: "google_oauth2",
            uid: "123456789",
            info:{
                email: "mail@domail.com",
                unverified_email: "mail@domail.com",
                verified_email: true,
                image: "https://domain.com/image.jpg"
            },
            credentials: {
                token: "xxxxxx",
                refresh_token: "xxxxxxx.1234",
                expires_at: 1590957743,
                expires: true
            },
            extra: {
                id_token: "xxxxxx",
                raw_info: {
                    sub: "123456789",
                    picture: "https://domain.com/image.jpg",
                    email: "mail@domail.com",
                    email_verified: true
                }
            }

        })
    end
    scenario "using google oauth2" do
        stub_omniauth
    end
    describe "GET /phrases" do
        before { get '/phrases' }
            it "Should return 200 Status code" do
              payload = JSON.parse(response.body)
              expect(payload).to be_empty
              expect(response).to have_http_status(200)
            end
    end
    # describe "with data in the database" do
    #     let!(:phrases) { create_list(:phrase, 10)}
    #     it " should return all the phrases" do
    #         get '/phrases'
    #         payload = JSON.parse(response.body)
    #         expect(payload.size).to eq(phrases.size)
    #         expect(response).to have_http_status(200)
    #     end
    # end
    # describe "GET /phrases/:id" do
    #     let!(:phrase) { create(:phrase)}
    #     before { get "/phrases/#{phrase.id}" }
    #     it "Should return a single phrase" do
    #         payload = JSON.parse(response.body)
    #         expect(payload).not_to be_empty
    #         expect(payload['id']).to eq(phrase.id)
    #         expect(payload['input_language']).to eq(phrase.input_language)
    #         expect(payload['output_language']).to eq(phrase.output_language)
    #         expect(payload['phonetic']).to eq(phrase.phonetic)
    #         expect(payload['audio_url']).to eq(phrase.audio_url)
    #         expect(payload['lesson_id']).to eq(phrase.lesson_id)
    #         expect(response).to have_http_status(200)
    #     end
    # end
    # describe "POST /phrases" do
    #     let!(:lesson) { create(:lesson)}
    #     it "Should create a phrase" do
    #         data = {
    #                 phrase: {
    #                 input_language: "hola", 
    #                 output_language: "hello",
    #                 phonetic: "jelou",
    #                 audio_url: "domain.com/file.mp3",
    #                 lesson_id: lesson.id
    #                 }
    #             }
    #         post '/phrases', params: data
    #         response_body = JSON.parse(response.body)
    #         expect(response_body).not_to be_empty
    #         expect(response_body['input_language']).to eq(data[:phrase][:input_language])
    #         expect(response_body['output_language']).to eq(data[:phrase][:output_language])
    #         expect(response_body['phonetic']).to eq(data[:phrase][:phonetic])
    #         expect(response_body['audio_url']).to eq(data[:phrase][:audio_url])
    #         expect(response_body['lesson_id']).to eq(data[:phrase][:lesson_id])
    #         expect(response).to have_http_status(201)
    #     end
    # end

    # describe "PUT /phrases/:id" do
    #     let!(:phrase) { create(:phrase)}
    #     it "Should update a phrase" do
    #         data = {
    #                 phrase: {
    #                 input_language: "hola", 
    #                 output_language: "hello",
    #                 phonetic: "jelou",
    #                 audio_url: "domain.com/file.mp3"
    #                 }
    #             }
    #         put "/phrases/#{phrase.id}", params: data
    #         response_body = JSON.parse(response.body)
    #         expect(response_body).not_to be_empty
    #         expect(response_body['id']).to eq(phrase.id)
    #         expect(response_body['input_language']).to eq(data[:phrase][:input_language])
    #         expect(response_body['output_language']).to eq(data[:phrase][:output_language])
    #         expect(response_body['phonetic']).to eq(data[:phrase][:phonetic])
    #         expect(response_body['audio_url']).to eq(data[:phrase][:audio_url])
    #         expect(response).to have_http_status(200)
    #     end
    # end

    # describe "DELETE /phrases/:id" do
    #     let!(:phrase) { create(:phrase)}
    #     it "Should delete a phrase" do
    #         delete "/phrases/#{phrase.id}"
    #         response_body = JSON.parse(response.body)
    #         expect(response_body).not_to be_empty
    #         expect(response_body['id']).to eq(phrase.id)
    #         expect(response_body['input_language']).to eq(phrase.input_language)
    #         expect(response_body['output_language']).to eq(phrase.output_language)
    #         expect(response_body['phonetic']).to eq(phrase.phonetic)
    #         expect(response_body['audio_url']).to eq(phrase.audio_url)
    #         expect(response_body['lesson_id']).to eq(phrase.lesson_id)
    #         expect(response).to have_http_status(200)
    #     end
    # end
end