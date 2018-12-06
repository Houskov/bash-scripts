i=1
for k in $(git branch -r --merged | grep -Ev 'master|develop|base|staging|prod|release'); do 
  if [ -z "$(git log -1 --since='44 week ago' -s $k)" ]; then
     git push origin :${k#"origin/"} 
     echo $i
     i=$[$i +1]
  fi
done