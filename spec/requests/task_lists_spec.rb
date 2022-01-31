require 'rails_helper'
require 'capybara/rails'

RSpec.describe "TaskLists", type: :request do
  # Tarefa 2
  # Item 2.4 - Spec de integração da lista de Tasks completas do User, com comentários em ordem alfabética
  describe 'Complete task list' do
    it 'Verify list of Tasks' do
      user = create(:user)
      profile = create(:profile, user: user)
      login_as(user)

      visit "/task_lists"
      expect(page).to have_selector('h1', text: 'List of your completed Tasks')
    end

    it ' Verify list of Comments Alphabetically' do
      user = create(:user)
      profile = create(:profile, user: user)
      login_as(user)

      visit "/task_lists"
      expect(page).to have_selector('h3', text: 'Comments by Alphabetical Order')
    end

    it 'Returns only tasks with "complete" status' do
      user = create(:user)
      profile = create(:profile, user: user)
      login_as(user)

      task = Task.new
      task.title = 'New Task'
      task.description = 'Description'
      task.priority = 'low'
      task.user = user
      task.save

      visit "/tasks/#{user.tasks.first.id}/edit"

      find('.edit_task') do
        fill_in 'task[status]', with: 'complete'
      end

      click_button 'Update Task'

      visit "/task_lists"
      expect(page).not_to have_content('incomplete')
    end
  end
end
