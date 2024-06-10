function run
    set number $argv[1]

    for i in (seq $number)
        eval $argv[2..-1]
    end
end
