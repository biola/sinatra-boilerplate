desc 'Run all deployment rake tasks'
task :post_deploy do
  if Dir.exists? 'tmp'
    FileUtils.touch 'tmp/restart.txt'
  end
end
