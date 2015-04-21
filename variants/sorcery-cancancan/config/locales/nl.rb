append_to_file 'config/locales/nl.yml' do
  <<-'RUBY'

  user_sessions:
    title: Login
    login: Aanmelden
    logout: Afmelden
    email: E-mailadres
    password: Wachtwoord
    login_created: U bent aangemeld
    login_failed: Aanmelden mislukt
    login_destroyed: U bent afgemeld
    login_first: U dient ingelogd te zijn om deze pagina te kunnen bekijken

  unauthorized:
    manage:
      all: Geen toegang tot deze pagina.
  RUBY
end
