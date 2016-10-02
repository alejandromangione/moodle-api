require 'rest-client'
require 'json'

module Moodle

  class Connector

    class << self; attr_accessor :mdl_url, :mdl_token, :mdl_first_password ; end

    def self.course_by_id(id)
      response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
        'wstoken': @mdl_token,
        'moodlewsrestformat': 'json',
        'wsfunction': 'core_course_get_courses',
        'options[ids][0]': id
      }

      return JSON.parse(response).first
    end

    def self.user_by_email(email)
      begin
        response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
          'wstoken': @mdl_token,
          'moodlewsrestformat': 'json',
          'wsfunction': 'core_user_get_users',
          'criteria[0][key]': 'email',
          'criteria[0][value]': email
        }

        return JSON.parse(response).first
      rescue
        puts "ERROR: On try to get moodle user"
        redirect_to error_path, flash: { referral_code: 1234 }
      end 
    end


    def self.user_by_username(username)
      begin
        response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
          'wstoken': @mdl_token,
          'moodlewsrestformat': 'json',
          'wsfunction': 'core_user_get_users',
          'criteria[0][key]': 'username',
          'criteria[0][value]': username
        }

        return JSON.parse(response).first
      rescue
        puts "ERROR: On try to get moodle user"
        redirect_to error_path, flash: { referral_code: 1234 }
      end 
    end


    def self.enrol_user(user_mdl_id, course_mdl_id)
      response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
        'wstoken': @mdl_token,
        'moodlewsrestformat': 'json',
        'wsfunction': 'enrol_manual_enrol_users',
        'enrolments[0][roleid]': 5, ## 5 -> Student Role
        'enrolments[0][userid]': user_mdl_id,
        'enrolments[0][courseid]': course_mdl_id
      }
    end


    def self.enrol_user_suspend(user_mdl_id, course_mdl_id, suspend = 1)
      response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
        'wstoken': @mdl_token,
        'moodlewsrestformat': 'json',
        'wsfunction': 'enrol_manual_enrol_users',
        'enrolments[0][roleid]': 5, ## 5 -> Student Role
        'enrolments[0][userid]': user_mdl_id,
        'enrolments[0][courseid]': course_mdl_id,
        'enrolments[0][suspend]': suspend
      }
    end

    def self.create_user(user_hash)
      response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
        'wstoken': @mdl_token,
        'moodlewsrestformat': 'json',
        'wsfunction': 'core_user_create_users',
        'users[0][username]': user_hash[:email],
        'users[0][password]': @mdl_first_password,
        'users[0][firstname]': user_hash[:firstname],
        'users[0][lastname]': user_hash[:lastname] ||= '',
        'users[0][email]': user_hash[:email],
        'users[0][city]': "#{user_hash[:city] ||= ''} - #{user_hash[:state] ||= ''}",
        'users[0][country]': 'BR',
        'users[0][description]': "CPF: #{user_hash[:cpf] ||= ''} | ENDEDEÇO: #{user_hash[:address] ||= ''} #{user_hash[:number_address] ||= ''} #{user_hash[:complement] ||= ''} - #{user_hash[:neighborhood] ||= ''} | CEP: #{user_hash[:cep] ||= ''}",
        'users[0][preferences][0][type]': 'auth_forcepasswordchange',
        'users[0][preferences][0][value]': 'true'
      }
    end

    def self.get_courses
      response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
        'wstoken': @mdl_token,
        'moodlewsrestformat': 'json',
        'wsfunction': 'core_course_get_courses'
      }
      return JSON.parse(response)
    end

    def self.reset_password(user_mdl_id)
        response = RestClient.post @mdl_url + "/webservice/rest/server.php", {
          'wstoken': @mdl_token,
          'moodlewsrestformat': 'json',
          'wsfunction': 'core_user_update_users',
          'users[0][id]': user_mdl_id,
          'users[0][password]': 'ieaa',
          'users[0][preferences][0][type]': 'auth_forcepasswordchange',
          'users[0][preferences][0][value]': 'true'
        }
        return response
    end

    def self.valid_user?(username, password)
      response = RestClient.post @mdl_url + "/webservice/rest/simpleserver.php", {
          'moodlewsrestformat': 'json',
          'wsusername': username,
          'wspassword': password,
          'wsfunction': 'core_webservice_get_site_info'
        }

      return !( ["wrongusernamepassword", "missingpassword"].any? { |errorcode| response.body.include? errorcode } )


    end

  end

end