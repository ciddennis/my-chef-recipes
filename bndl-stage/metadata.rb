name              'bndl-stage'
maintainer        'Cid Dennis'
maintainer_email  'cid.dennis@gmail.com'
license           'Apache 2.0'
description       'Set up for BNDL Staging'
version           '1.0.0'
recipe            'bndl-stage', 'Configures simple staging server'

%w{ ubuntu }.each do |os|
  supports os
end

depends 'database'