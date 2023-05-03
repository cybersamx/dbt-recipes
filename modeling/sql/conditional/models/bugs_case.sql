select
    title,
    type,
    case
        when type = 'network' or type = 'vm' or type = 'security' then 1
        when type = 'data' or type = 'api' then 2
        when type = 'web' or type = 'mobile' then 3
        else 4
    end as assigned_priority
from
    {{ ref('bugs') }}
