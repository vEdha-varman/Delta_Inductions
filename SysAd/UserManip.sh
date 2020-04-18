for i in {1..3}
    do
    sudo useradd --create-home u$i
    echo -e "toor$i\ntoor$i" | sudo passwd u$i
done
