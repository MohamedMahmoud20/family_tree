import 'package:graphview/GraphView.dart';
import 'package:flutter/material.dart';


// graphview: ^1.1.1 //// اسم المكتبه
class TreeScreen extends StatefulWidget {
  @override
  _TreeScreenState createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  // final node1 = Node.Id(1);
  // final node2 = Node.Id(2);
  // final node3 = Node.Id(3);
  // final node4 = Node.Id(4);
  // final node5 = Node.Id(5);
  // final node6 = Node.Id(6);
  // final node8 = Node.Id(7);
  // final node7 = Node.Id(8);
  // final node9 = Node.Id(9);
  // final node10 = Node.Id(10);
  // final node11 = Node.Id(11);
  // final node12 = Node.Id(12);

  // Random r = Random();

/////////////////// ده شكل الجيسون اللي المفروض يرجع من الباك اند علشان يترسم

  var json = {
    "nodes": [
      {"id": 1, "label": 'circle'},
      {"id": 2, "label": 'ellipse'},
      {"id": 3, "label": 'database'},
      {"id": 4, "label": 'box'},
      {"id": 5, "label": 'diamond'},
      {"id": 6, "label": 'dot'},
      {"id": 7, "label": 'square'},
      {"id": 8, "label": 'triangle'},
    ],
    "edges": [
      {"from": 1, "to": 2},
      {"from": 2, "to": 3},
      {"from": 2, "to": 4},
      {"from": 2, "to": 5},
      {"from": 5, "to": 6},
      {"from": 5, "to": 7},
      {"from": 6, "to": 8}
    ]
  };

///////////////////////////////////////////////////////////////////////////

  Color getEdgeColor({required int from}) {
    switch (from) {
      case 2:
        return Colors.red;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.green;
      case 6:
        return Colors.grey;
      case 7:
        return Colors.cyan;
      case 8:
        return Colors.brown;
      case 5:
        return Colors.indigo;

      default:
        return Colors.brown;
    }
  }

  @override
  void initState() {
    super.initState();

    (json["edges"] as List).forEach((element) {
      var fromNodeId = element['from'];
      var toNodeId = element['to'];
      graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId),
          paint: Paint()
            ..color = getEdgeColor(from: fromNodeId)
            ..strokeWidth = 1.0);
    });
    builder
      ..siblingSeparation = (10)
      ..levelSeparation = (50)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP);


    // graph.addEdge(node1, node2, paint: Paint()..color = Colors.blue);
    // graph.addEdge(node1, node3, paint: Paint()..color = Colors.blue);
    // graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    // graph.addEdge(node1, node5, paint: Paint()..color = Colors.blue);
    //

    // graph.addEdge(node2, node5);
    // graph.addEdge(node2, node6);
    // graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    // graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    // graph.addEdge(node4, node9);
    // graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    // graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    // graph.addEdge(node11, node12);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InteractiveViewer(
                    constrained: false,
                    boundaryMargin: EdgeInsets.all(100),
                    minScale: 0.001,
                    maxScale: 10,
                    child: GraphView(
                      graph: graph,
                      algorithm: BuchheimWalkerAlgorithm(
                          builder, TreeEdgeRenderer(builder)),
                      paint: Paint()
                        ..color = Colors.green
                        ..strokeWidth = 1
                        ..style = PaintingStyle.stroke,
                      builder: (Node node) {
                        var a = node.key!.value as int;
                        var nodes = json['nodes'];
                        var nodeValue =
                        nodes!.firstWhere((element) => element['id'] == a);
                        return rectangleWidget(nodeValue['label'] as String);
                      },
                    )),
              ),
            ],
          ),
        ));
  }

  Widget rectangleWidget(var a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(color: Colors.blue, spreadRadius: 1),
            ],
          ),
          child: Text('Node ${a}')),
    );
  }
}
