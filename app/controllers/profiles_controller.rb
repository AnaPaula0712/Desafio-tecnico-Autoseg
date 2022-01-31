class ProfilesController < ApplicationController
  # Chamada do método "find_profile", para localizar o profile através do id.
  before_action :find_profile, only: %i[show private_page edit update change_privacy]
  before_action :authenticate_user!
  before_action :public?, except: %i[private_page show]

  # Implementação do método "show", para exibir o perfil do usuário.
  def show; end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    current_user.profile_id = @profile.id
    if @profile.save
      flash[:notice] = 'Profile Created!'
      redirect_to @profile
    else
      render :new
    end
  end

  # Implementação do método "edit", para alterar o perfil do usuário.
  def edit; end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Profile Updated!'
      redirect_to @profile
    else
      render :edit
    end
  end

  # Alteração do método "change_privacy", para que o usuário seja capaz
  # de deixar seu perfil público ou privado.
  def change_privacy
    @profile.update(privacy_params)
    redirect_to @profile
  end

  def private_page; end

  private

  # Implementação do método "profile_params", para filtrar os parâmetros
  # requeridos e permitidos (Strong parameters).
  def profile_params
    params.require(:profile).permit(:nickname, :bio, :avatar)
  end

  def privacy_params
    params.require(:profile).permit(:share)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def public?
    unless (current_user.profile == @profile)
      unless @profile.share
        redirect_to private_page_profile_path(@profile)
      end
    end
  end
end

# Tarefa 1:
# 1 - Logo na sequência que criou a conta no passo anterior, será necessário criar um perfil.
# Porém há um bug nesta feature, a atividade da tarefa 1 é tentar identificá-lo e corrigir.

# Resposta:
# 1.1 - Identificação do bug: Mesmo preenchendo os dados do profile ele não era exibido, pois a
# action create não recebia os parameters, já que o método "profile_params" estava vazio.

# 1.2 - Correção:Após a adição dos parameters o app passou a criar o perfil.
# Outras ações realizadas neste contrller:
# - acionamento do método "find_profile" como "before_action",
# - implementação dos métodos "show" e "edit", alteração do método "change_privacy" e
# - implementação dos Strong parameters através do método "profile_params".
