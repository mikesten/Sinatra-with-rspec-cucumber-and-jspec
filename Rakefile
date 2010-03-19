desc "Run those specs"
task :spec do
  require 'spec/rake/spectask'
 
  Spec::Rake::SpecTask.new do |t|
    t.spec_opts = %w{--colour --format progress --loadby mtime --reverse}
    t.spec_files = FileList['test/rspec/*_spec.rb']
  end
end
require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.libs << 'lib'
  t.cucumber_opts = "--format pretty test/features/*.feature"
end

desc "Run all the tests (rspec, cucumber and jspec)"
task :test => [:spec, :cucumber] do
  sh "jspec run test/jspec/dom.html"
end