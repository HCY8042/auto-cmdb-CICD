var ul = `<ul class="treeview-menu" style="display: block;">`
let li = []

function displayNode(nodes) {
    for (node of nodes) {
        if (node.sub_node.length === 0) {

            li.push(`<li><a href="/cbv/servers/?node_id=${node.id}"><i class="fa fa-circle-o"></i> 
                ${node.node_name}</a>
              </li>`)
        } else {
            li.push(`<li class="treeview menu-open" style="height: auto;">
                    <a href="#"><i class="fa fa-circle-o"></i>
                         ${node.node_name}
                      <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                      </span>
                    </a>`)
            li.push(ul)

            displayNode(node.sub_node)
            li.push('</ul>')
            li.push('</li>')
            }
    }
    return li
}