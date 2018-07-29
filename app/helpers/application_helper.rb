module ApplicationHelper
    def flash_class(level)
        case level
        when 'notice'  then 'modal is-active notification is-info'
        when 'success' then 'modal is-active notification is-success'
        when 'error'   then 'modal is-active notification is-danger'
        when 'alert'   then 'modal is-active notification is-warning'
        end
    end
end
