# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Student API', type: :request do
  # initialize test data 
  let!(:student) { create_list(:student, 10) }
  let(:student_id) { student.first.id }

  # Test suite for GET /todos
  describe 'GET /student' do
    # make HTTP get request before each example
    before { get '/student' }

    it 'returns student' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /student/:id' do
    before { get "/student/#{student_id}" }

    context 'when the record exists' do
      it 'returns the student' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(student_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:student_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Student/)
      end
    end
  end

  # Test suite for POST /student
  describe 'POST /student' do
    # valid payload
    let(:valid_attributes) { { student_name: 'Learn Elm', roll: '1' } }

    context 'when the request is valid' do
      before { post '/student', params: valid_attributes }

      it 'creates a student' do
        expect(json['student_name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/student', params: { student_name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Roll can't be blank/)
      end
    end
  end

  # Test suite for PUT /student/:id
  describe 'PUT /student/:id' do
    let(:valid_attributes) { { student_name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/student/#{student_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /student/:id' do
    before { delete "/student/#{student_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end