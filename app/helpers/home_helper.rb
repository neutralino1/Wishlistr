module HomeHelper

  def englishJoin(arr)
    return '' if not arr
    case arr.size
    when 0 then ''
    when 1 then arr[0]
    when 2 then arr.join(' and ')
    else arr[0..-2].join(', ') + ', and ' + arr[-1]
    end
  end

  def have(n)
    if n == 1
      return 'has'
    elsif n > 1
      return 'have'
    else return 'GNARK!'
    end
  end

  def possesive(user1, user2)
    if user1 == user2
      return 'your'
    else
      return user1+"'s"
    end
  end

  def you(user1, user2)
    if user1 == user2
      return 'you'
    else
      return user1
    end
  end

  def oddity(i)
    if i%2==0
      return 'even'
    else
      return 'odd'
    end
  end
end
