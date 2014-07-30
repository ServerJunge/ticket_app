class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Ticketapp::Application.routes.draw do
  constraints(SubdomainPresent) do
    root 'tickets#index', as: :subdomain_root
    devise_for :users
    resources :users, only: :index
    resources :tickets, except: [:index, :show, :destroy]
  end

  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
  end
end
