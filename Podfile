def shared_pods
    pod 'AFNetworking'
end

target 'iamhere', :exclusive => true do
   shared_pods 
end

target 'iamhereTests' , :exclusive => true do
end

link_with ['iamhere', 'iamhereTests']
