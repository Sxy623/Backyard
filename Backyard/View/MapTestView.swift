import SwiftUI
import MapKit

struct MapTestView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.9247, longitude: 116.4074), // 北京
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    let locations: [Location] = [
        Location(name: "标记点", coordinate: CLLocationCoordinate2D(latitude: 39.9242, longitude: 116.4074)), // 北京
        Location(name: "标记点", coordinate: CLLocationCoordinate2D(latitude: 39.9342, longitude: 116.4074)) // 北京
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapPin(coordinate: location.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all) // 让地图填满整个视图
        .navigationTitle("地图测试")
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapTestView_Previews: PreviewProvider {
    static var previews: some View {
        MapTestView()
    }
}
