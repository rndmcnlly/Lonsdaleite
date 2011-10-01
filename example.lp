

#begin_lua
  function format(template, ...)
    strings = {}
    for i, v in ipairs(arg) do
      table.insert(strings,tostring(v))
    end
    return Val.new(Val.ID,[["]]..string.format(template,unpack(strings))..[["]])
  end
#end_lua.

node(a;b;c;d;e).

edge(a,b).
edge(b,c).
edge(c,d).
edge(d,e).
edge(c,e).
edge(e,a).

at(a,0,0).
at(b,5,5).

label(a,"origin").
label(e,777).

label(b,c,"beecee").

graphviz_type(digraph).
graphviz_engine(neato).
graphviz_global_node_attr(shape,circle).
graphviz_global_edge_attr(color,red).
graphviz_node(N) :- node(N).
graphviz_edge(N1,N2) :- edge(N1,N2).
graphviz_edge_attr(N1,N2,label,L) :- label(N1,N2,L).
graphviz_node_attr(N,label,@format("%s[%s]",N,L)) :- label(N,L).
graphviz_node_attr(N,shape,square) :- label(N,_).
graphviz_node_attr(N,pos,@format("%s,%s!",X,Y)) :- at(N,X,Y).
