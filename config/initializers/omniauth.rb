Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '255949524467036', '8844bb5bd7f4beaeea2aed33c3f21c80'
end
